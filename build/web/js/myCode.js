function confirmDel(){
    confirm("Bạn có chắc chắn muốn xóa sản phẩm?");
}

function tuyChon(){
    var option = document.querySelector(".tuyChon");
    if(option.style.display === "none"){
        option.style.display = "flex";
    }else
        option.style.display = "none";
}