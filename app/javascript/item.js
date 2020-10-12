$(function() {
  $(".price-input").on("keyup", function() {
    let input = $(".price-input").val();
    let fee = input * 0.1
    let profit = input - fee
    $("#add-tax-price").html(fee);
    $("#profit").html(profit);
  });
});
