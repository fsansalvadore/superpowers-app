import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr(".datepicker", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#booking_end_date"})],
  onChange: function(selectedDates, dateStr, instance) {
          console.log("dhhfshfs");
          let daysInRange = document.getElementsByClassName('inRange');
          let daysLengthTotal = daysInRange.length + 1;
          let daysDisplay = document.getElementById('days-display');
          let totalAmount = document.getElementById('total-amount-display');
          let bookingPrice = document.getElementById('booking_price').dataset.price;
          let totalPriceForm = document.getElementById('booking_price');
          let priceDisplay = document.getElementById('price-display');
          let total = parseInt(bookingPrice, 10) * daysLengthTotal;

          daysDisplay.innerText = daysLengthTotal;
          priceDisplay.innerText = total;
          totalPriceForm.value = total;
          console.log("Booking: " + typeof bookingPrice);
          console.log(total);
          console.log(typeof daysLengthTotal);
        }
})
