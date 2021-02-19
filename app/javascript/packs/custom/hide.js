hideFunction = () =>{
  let component = document.querySelector("#hideComponent");
  if (component.style.display === "none") {
    component.style.display = "block";
  } else {
    component.style.display = "none";
  }
}