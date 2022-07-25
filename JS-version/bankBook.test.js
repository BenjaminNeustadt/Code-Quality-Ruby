const bankBook = require('./bankBook');

// INPUT: debit(400)       OUTPUT: date: [...], credit: undefined, debit: 400, balance: 400
// First we will do without the date

describe('bankBook', () => {

  it('should return a balance of 400 when print method is called', () => {
    const bankBook = new bankBook();
    bankBook.debit(400);
    expect(bankBook.print()).toEqual("credit:'',  debit: 400, balance: 400");
  });
  
});

