window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener('input', () => {
     addTaxDom.innerHTML = `${Math.floor(priceInput.value * 0.1)}`;
     profit.innerHTML = `${Math.floor(priceInput.value * 0.9)}`;
  })
})
