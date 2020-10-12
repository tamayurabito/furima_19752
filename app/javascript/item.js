$(function() {
  $(".price-input").on("keyup", function() {
    let input = $(".price-input").val();
    console.log(input);
    let fee = input * 0.1
    console.log(fee);
    let profit = input - fee
    console.log(profit);
    $("#add-tax-price").html(fee);
    $("#profit").html(profit);
  });
});
