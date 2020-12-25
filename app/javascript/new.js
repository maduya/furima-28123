const { clearCache } = require("turbolinks")

window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
   console.log(inputValue);
   
  const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(inputValue * 0.1 )
     console.log(addTaxDom);

  const addProfit = document.getElementById("profit");
     addProfit.innerHTML = (inputValue - addTaxDom.innerHTML) 
     console.log(addProfit);
  })
})