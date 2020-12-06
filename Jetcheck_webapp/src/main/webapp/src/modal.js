var pwModal = document.getElementById("pwModal");
var itemModal = document.getElementById("itemModal");

function closePWModal() {
    pwModal.style.display = "none";
}
function openPWModal() {
    pwModal.style.display = "block";
}
window.onclick = function (event) {
    if (event.target == pwModal ) {
        pwModal.style.display = "none";
    }
    else if(event.target == itemModal){
        itemModal.style.display = "none";
    }
};
function closeItemModal() {
    itemModal.style.display = "none";
}
function openItemModal() {
    itemModal.style.display = "block";
}
