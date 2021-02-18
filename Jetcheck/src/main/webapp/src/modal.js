var pwModal = document.getElementById("pwModal");
var itemModal = document.getElementById("itemModal");

function openModal(modalname){
    document.getElementById(modalname).style.display = "block";
    
}
function closeModal(modalname){
    document.getElementById(modalname).style.display = "none";
}

//OLD ---- USE openModal / closeModal instead
function closePWModal() {
    pwModal.style.display = "none";
}
//OLD ---- USE openModal / closeModal instead
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

//OLD ---- USE openModal / closeModal instead
function closeItemModal() {
    itemModal.style.display = "none";
}
//OLD ---- USE openModal / closeModal instead
function openItemModal() {
    itemModal.style.display = "block";
}
