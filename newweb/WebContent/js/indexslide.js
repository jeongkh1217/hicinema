let imageIndex = 0;
let position = 0;
const IMAGE_WIDTH= 200;
const btnPrevious = document.querySelector(".previous")
const btnNext = document.querySelector(".next")
let images = document.querySelectorAll(".movieimgslidecontainer")
function prev() {
    if(imageIndex>0) {
        btnNext.removeAttribute("disabled")
        position += IMAGE_WIDTH;
        for (var i=0; i<images.length;i++) {
        images[i].style.transform = `translateX(${position}px)`;}
        imageIndex = imageIndex -1;
    }
    if(imageIndex ==0) {
        btnPrevious.setAttribute('disabled','true')
    }
}
function next() {
    if(imageIndex<14) {
        btnPrevious.removeAttribute("disabled")
        position -= IMAGE_WIDTH;
        for (var i=0; i<images.length;i++) {
        images[i].style.transform=`translateX(${position}px)`;}
        imageIndex=imageIndex +=1;
    }
    if(imageIndex==14) {
        btnNext.setAttribute('disabled','true')
    }
}
function init() {
    btnPrevious.setAttribute('disabled','true');
    btnPrevious.addEventListener("click",prev);
    btnNext.addEventListener("click",next);
}
init();