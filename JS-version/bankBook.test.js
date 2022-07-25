const bankBook = require('./bankBook');

describe('BankBook', () => {
  // // INPUT: debit(400)    OUTPUT: date: [...], credit: undefined, debit: 400, balance: 400
  // it('should return correct values when print method is called', () => {
  //   const book = new bankBook();
  //   book.debit(400);
  //   expect(book.print()).toEqual({"credit": null, "debit": 400, "balance": 400});
  // });

  it('return the date', () => {
    const book = new bankBook();
    expect(book.print()).toEqual([{date: null,credit: null,debit: null, balance: null}])
  })


  // date || credit || debit || balance
  // 10/01/2023 || 1000.00 || || 1000.00
  // THIS NEXT TEST SHOULD OUTPUT LIKE THIS

  // it('should return correct values when print method is called', () => {
  //   const book = new bankBook();
  //   book.credit(1000.00);
  //   expect(book.print()).toEqual([{date: '10/01/2023' ,credit: 1000.00,debit: null, balance: 1000.00}]);
  // });



});

