var qrcode = new QRCode("qrcode", {
    text: "http://santa-giving-tree.herokuapp.com/tags/" + code,
    width: 128,
    height: 128,
    colorDark : "#59abe3",
    colorLight : "#ffffff",
    correctLevel : QRCode.CorrectLevel.H
});