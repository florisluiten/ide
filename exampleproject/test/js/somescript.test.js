const somescript = require('../../js/somescript');

test('outputs hello world', () => {
	expect(somescript.sum(1, 1)).toBe(2);
	expect(somescript.sum(0, 2)).toBe(2);
});
