const data=document.getElementById("service").textContent,pngImage="/assets/img/services-candidates/"+data+".png",svgImage="/assets/img/services-candidates/"+data+".svg";let image=pngImage;fetch(image).then(e=>{e.ok||(image=svgImage),new QRCodeStyling({width:160,height:160,type:"svg",data:"https://apps.apple.com/app/apple-store/id1659205365?pt=122171064&ct=/services/"+data,image:image,dotsOptions:{color:"#1B294C",type:"rounded"},cornersSquareOptions:{type:"extra-rounded"},backgroundOptions:{color:"#fff"},imageOptions:{crossOrigin:"anonymous",margin:5},qrOptions:{errorCorrectionLevel:"H"}}).append(document.getElementById("newqrcode"))}).catch(e=>{console.error("Error fetching image:",e)});