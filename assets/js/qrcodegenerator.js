function loadAndGenerateQRCode(){var e=document.createElement("script");e.src="https://cdnjs.cloudflare.com/ajax/libs/qrcode-generator/1.4.4/qrcode.min.js",e.onload=function(){var e=qrcode(10,"H");e.addData(window.location.href),e.make(),document.getElementById("qrcode").innerHTML=e.createImgTag()},document.body.appendChild(e)}window.onload=loadAndGenerateQRCode;