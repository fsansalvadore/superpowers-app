import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const bookingCalculator = document.getElementById('booking-calculator');
const bookingSubmit = document.getElementById('booking-btn');

flatpickr(".datepicker", {
  altInput: true,
  defaultDate: new Date(),
  minDate: new Date(),
  plugins: [new rangePlugin({ input: "#booking_end_date"})],
  onChange: function(selectedDates, dateStr, instance) {
          console.log(`date picked`);

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

          // Shows and removes the calculator part when 2 dates are picked
          if (selectedDates.length == 2) {
            bookingCalculator.classList.remove('invisible');
            bookingSubmit.removeAttribute("disabled");

          } else {
            bookingCalculator.classList.add('invisible');
            bookingSubmit.setAttribute("disabled", true);
          }

        }
});



