/**
 * Creates a plural form of any term.
 * If a plural form is not defined, will just add an "s".  Pretty basic.
 */
export function pluralize(term) {
  const plurals = {
    person: "people"
  };
  if (plurals.hasOwnProperty(term)) {
    return plurals[term];
  }
  return `${term}s`;
}
