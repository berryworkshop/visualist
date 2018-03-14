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

/**
 * Creates a plural form of any term.
 */
String.prototype.pluralize = function() {
  const plurals = {
    person: "people"
  };
  if (plurals.hasOwnProperty(this)) {
    return plurals[this];
  }
  return `${this}s`;
};

/**
 * Converts any string to title case.
 * Hat tip: https://stackoverflow.com/a/5574446/652626
 */
String.prototype.toTitleCase = function() {
  return this.replace(/\w\S*/g, function(txt) {
    return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
  });
};
