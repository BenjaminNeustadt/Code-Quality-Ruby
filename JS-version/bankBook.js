class bankBook {
  constructor () {
    this.balance = [{date: null, credit: null, debit: null, balance: null}]
    this.transactions = []
  }

  credit(number) {
    const aTransaction = {date: null, credit: null, debit: null, balance: null}
    aTransaction.push(this.balance[0].credit += number) && (this.balance[0].balance += number);
  }

  print() {
    return this.balance;
  }

  // A method for formatting the date nicely
  formatDate() {
    const today = new Date();
    const yyyy = today.getFullYear();
    let mm = today.getMonth() + 1; // Months start at 0!
    let dd = today.getDate();

    if (dd < 10) dd = '0' + dd;
    if (mm < 10) mm = '0' + mm;

    const formatToday = dd + '/' + mm + '/' + yyyy;
    return formatToday;
  }
}

module.exports = bankBook;