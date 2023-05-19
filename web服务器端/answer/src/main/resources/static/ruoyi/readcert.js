function doReadCert() {
	if(doConnect()){
		var strResult = jQuery.parseJSON(CertCtl.readCert());
		if(strResult.resultFlag==0){
			var bean=strResult.resultContent;
			$("#patientName").val(bean.partyName);
			$("#patientSex").val(bean.gender);
			//$("#nation").val(bean.nation);
			$("#patientBirth").val(fomatDate(bean.bornDay));
			$("#patientCard").val(bean.certNumber);
			$("#patientAddress").val(bean.certAddress);
			//uploadPhoto(bean.identityPic);
		}else{
			alert(strResult.errorMsg);
		}
	}
}

function doConnect() {
	var strResult = jQuery.parseJSON(CertCtl.connect());
	if(strResult.resultFlag==0){
		return true;
	}
	alert("请连接身份证阅读器！");
	return false;
} 