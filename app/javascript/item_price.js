if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = 0.1
    const fee = Math.floor(inputValue * tax)
    const profit = inputValue - fee
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = fee;
    profitArea.innerHTML = profit;
    })
  });
}


