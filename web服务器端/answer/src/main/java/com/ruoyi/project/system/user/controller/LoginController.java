package com.ruoyi.project.system.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.HttpClientUtil;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.WechatGetUserInfoUtil;
import com.ruoyi.framework.shiro.service.PasswordService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.IUserService;

/**
 * 登录验证
 * 
 * @author sunhuaquan
 */
@Controller
public class LoginController extends BaseController
{
	
	@Autowired
	private IUserService userService;
	
	@Autowired
    private PasswordService passwordService;
	
    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response)
    {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request))
        {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe)
    {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject(); 
        try
        {
            subject.login(token);
            return success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }
    
    
    /**
	 * d登录接口
	 * @param encryptedData
	 * @param iv
	 * @param code
	 * @return
	 */
	@PostMapping("/onLogin")
	@ResponseBody
	public AjaxResult login(String encryptedData, String iv, String code) {
		if(!StringUtils.isNotBlank(code)){
			return AjaxResult.error("未获取到用户凭证code");
		}
		String apiUrl="https://api.weixin.qq.com/sns/jscode2session?appid=wx977a202385225d6b&secret=85de648d41112463401adde4e13b8335&js_code="+code+"&grant_type=authorization_code";
		System.out.println(apiUrl);
		String responseBody = HttpClientUtil.doGet(apiUrl);
		System.out.println(responseBody);
		JSONObject jsonObject = JSON.parseObject(responseBody);
		if(StringUtils.isNotBlank(jsonObject.getString("openid"))&&StringUtils.isNotBlank(jsonObject.getString("session_key"))){
			//解密获取用户信息
			JSONObject userInfoJSON=WechatGetUserInfoUtil.getUserInfo(encryptedData,jsonObject.getString("session_key"),iv);
			if(userInfoJSON!=null){
				//这步应该set进实体类
				Map userInfo = new HashMap();
				//userInfo.put("openId", userInfoJSON.get("openId"));
				userInfo.put("openId", jsonObject.getString("openid"));
				userInfo.put("nickName", userInfoJSON.get("nickName"));
				userInfo.put("gender", userInfoJSON.get("gender"));
				userInfo.put("city", userInfoJSON.get("city"));
				userInfo.put("province", userInfoJSON.get("province"));
				userInfo.put("country", userInfoJSON.get("country"));
				userInfo.put("avatarUrl", userInfoJSON.get("avatarUrl"));
				// 解密unionId & openId;
				if (userInfoJSON.get("unionId")!=null) {
					userInfo.put("unionId", userInfoJSON.get("unionId"));
				}
				//然后根据openid去数据库判断有没有该用户信息，若没有则存入数据库，有则返回用户数据
				AjaxResult result=AjaxResult.success("登陆成功");
				result.put("userInfo", userInfo);
				String uuid=UUID.randomUUID().toString();
				result.put("WXTOKEN", uuid);
				
				//判断是否已绑定用户
				//User user =userService.selectUserByOpenId(userInfoJSON.get("openId").toString());
				User user =userService.selectUserByOpenId(jsonObject.getString("openid"));
				 
				if(user!=null&&user.isAdmin()){
					user=null;
				}
				result.put("systemUser", user);
				
				return result;
			}else{
				return AjaxResult.error("解密失败");
			}
		}else{
			return AjaxResult.error("未获取到用户openid 或 session");
		}
	}
	
	
	@PostMapping("/bindUser")
    @ResponseBody
    public AjaxResult bindUser(String loginName,String openId,String password)
    {        
        if(!StringUtils.isEmpty(loginName)){
        	User user=userService.selectUserByLoginName(loginName);
        	if(null!=user && (passwordService.encryptPassword(user.getLoginName(),password, user.getSalt()).equals(user.getPassword()))){
        		user.setOpenId(openId);
        		userService.updateUserInfo(user);
        		AjaxResult result=AjaxResult.success("绑定用户成功！");
        		result.put("systemUser", user);
        		return result;
        	}
        }
        return AjaxResult.error("用户名或密码错误！");
    }
    
    @PostMapping("/updateIntegral")
    @ResponseBody
    public AjaxResult bindUser(Long userId,Integer integral)
    {        
    	if(userId!=null){
    		User user=userService.selectUserById(userId);
    		user.setIntegral(integral);
    		userService.updateUserInfo(user);
    		return AjaxResult.success();
    	}
        return AjaxResult.error();
    }


    @GetMapping("/unauth")
    public String unauth()
    {
        return "/error/unauth";
    }
}
