function fee () {
  const item_price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  item_price.addEventListener("input", () => {
    if ( isFinite(item_price.value) ) {
      const amount_tax = Math.floor(item_price.value * 0.1 );
      tax.innerHTML = amount_tax.toLocaleString();
      const amount_profit = item_price.value - Math.floor(item_price.value * 0.1 );
      profit.innerHTML = amount_profit.toLocaleString();
    } else {
      tax.innerHTML = "NaN";
      profit.innerHTML = "NaN";
    };
  });
};
window.addEventListener("load", fee);
