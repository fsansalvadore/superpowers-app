const bookingPrice = () => {
  const end = document.getElementById('booking_end_date');
  const start = document.getElementById('booking_start_date');
  const start_date = new Date(start.value).toISOString();
  const end_date = new Date(end.value).toISOString();
  let daysCount = (Date.parse(end_date) - Date.parse(start_date)) / 86400000;
  console.log(end_date);
  console.log(start_date);
  console.log(daysCount);
  console.log("Coming from booking_form.js");
};

// export bookingPrice;
