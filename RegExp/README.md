# Complete RegExp Learning & Problem-Solving Roadmap (Dart)

**Goal:** Build a strong, practical understanding of Regular Expressions (RegExp), from individual syntax features to complex real-world text-processing problems.

**Language:** Dart  
**Regex flavor:** Dart's `RegExp` uses ECMAScript-style regular-expression syntax. Some features and behavior can differ between regex engines, so always test patterns in Dart.

---

## How to use this roadmap

For every exercise:

1. Read the requirement and identify exactly what should match.
2. Write the pattern yourself before looking up an answer.
3. Test several valid examples.
4. Test invalid examples and edge cases.
5. Try the pattern in Dart using the most suitable method.
6. Explain every part of your pattern in plain language.
7. If possible, solve the problem another way and compare the results.

Do not assume that a regex match proves that data is valid in every real-world sense. For example, a date-shaped string may still be an impossible date, and a string that resembles an email address may not be deliverable.

---

# Part 1 — RegExp syntax reference

## 1. Literal characters and character classes

| Syntax | Meaning | Example use |
|---|---|---|
| `a` | Matches the literal character `a` | `cat` |
| `.` | Matches any character except line terminators by default | `a.c` |
| `[abc]` | Matches one character: `a`, `b`, or `c` | `[aeiou]` |
| `[^abc]` | Matches one character other than `a`, `b`, or `c` | `[^0-9]` |
| `[a-z]` | Matches one lowercase ASCII letter | `[a-z]+` |
| `[A-Z]` | Matches one uppercase ASCII letter | `[A-Z]+` |
| `[0-9]` | Matches one digit | `[0-9]+` |
| `[a-zA-Z]` | Matches one English letter | `[a-zA-Z]+` |
| `\d` | Matches a digit | `\d+` |
| `\D` | Matches a non-digit | `\D+` |
| `\w` | Matches an ECMAScript word character (letters, digits, underscore) | `\w+` |
| `\W` | Matches a non-word character | `\W+` |
| `\s` | Matches whitespace | `\s+` |
| `\S` | Matches non-whitespace | `\S+` |
| `\t` | Matches a tab | `\t` |
| `\n` | Matches a line feed | `\n` |
| `\r` | Matches a carriage return | `\r` |

**Important notes**

- A character class such as `[abc]` matches one character from the set, not the whole string `abc`.
- A hyphen can indicate a range inside a character class, as in `[a-z]`. Escape it or put it in a safe position when you need a literal hyphen.
- `\w` is not a general definition of every letter in every language. For international text, investigate Unicode property escapes supported by the Dart regex mode you are using.
- In Dart source code, remember that backslashes in ordinary string literals may need escaping. A raw string such as `r'\d+'` is often convenient.

## 2. Quantifiers

| Syntax | Meaning |
|---|---|
| `*` | Zero or more repetitions |
| `+` | One or more repetitions |
| `?` | Zero or one repetition |
| `{3}` | Exactly 3 repetitions |
| `{2,5}` | Between 2 and 5 repetitions |
| `{3,}` | At least 3 repetitions |
| `*?` | Lazy zero-or-more quantifier |
| `+?` | Lazy one-or-more quantifier |
| `??` | Lazy zero-or-one quantifier |
| `{2,5}?` | Lazy bounded quantifier |

**Greedy vs. lazy**

- Greedy quantifiers try to consume as much text as possible while still allowing the overall pattern to match.
- Lazy quantifiers try to consume as little as possible while still allowing the overall pattern to match.
- Lazy matching does not automatically make a pattern safer or more correct.

## 3. Anchors and boundaries

| Syntax | Meaning |
|---|---|
| `^` | Beginning of input; with multiline mode, beginning of a line |
| `$` | End of input; with multiline mode, end of a line |
| `\b` | Word boundary |
| `\B` | Position that is not a word boundary |

Use anchors when the entire input must match a format. Without anchors, a pattern may find a valid-looking substring inside an otherwise invalid string.

## 4. Groups and capturing

| Syntax | Meaning |
|---|---|
| `(abc)` | Capturing group |
| `(?:abc)` | Non-capturing group |
| `(?<name>abc)` | Named capturing group |
| `\1` | Backreference to the first capturing group |
| `\2` | Backreference to the second capturing group |
| `\k<name>` | Named backreference |

Groups can be used to:

- Treat several characters as one unit.
- Apply a quantifier to a sequence.
- Combine alternatives.
- Extract parts of a match.
- Refer back to text matched earlier.

## 5. Alternation

| Syntax | Meaning |
|---|---|
| `cat\|dog` | Matches `cat` or `dog` |
| `(?:jpg\|png\|pdf)` | Matches one of the listed extensions |

Alternation has precedence rules. Use groups when the alternatives are part of a larger expression. For example, anchor the whole choice rather than accidentally anchoring only one branch.

## 6. Lookarounds

| Syntax | Meaning |
|---|---|
| `(?=abc)` | Positive lookahead: the next text must match `abc` |
| `(?!abc)` | Negative lookahead: the next text must not match `abc` |
| `(?<=abc)` | Positive lookbehind: the preceding text must match `abc` |
| `(?<!abc)` | Negative lookbehind: the preceding text must not match `abc` |

Lookarounds check context without including that context in the matched text. Test lookbehind patterns in the target Dart runtime, especially when using variable-length alternatives.

## 7. Escaping special characters

These characters have special meanings in regex syntax and usually need escaping when you want to match them literally:

```text
. * + ? ^ $ { } ( ) [ ] | \
```

Examples:

| Pattern | Matches |
|---|---|
| `\.` | A literal dot |
| `\+` | A literal plus sign |
| `\(` | A literal opening parenthesis |
| `\)` | A literal closing parenthesis |
| `\\` | A literal backslash |

Dart raw strings make regex patterns easier to read:

```dart
final pattern = RegExp(r'\d+');
```

## 8. Flags and Dart RegExp options

Dart exposes these important options through `RegExp`:

| Option | Purpose |
|---|---|
| `caseSensitive` | Controls case-sensitive matching |
| `multiLine` | Changes the behavior of `^` and `$` around line boundaries |
| `dotAll` | Allows `.` to match line terminators |
| `unicode` | Enables Unicode mode |

Example:

```dart
final pattern = RegExp(
  r'^hello$',
  caseSensitive: false,
  multiLine: false,
  dotAll: false,
  unicode: true,
);
```

Compare the same pattern with different options and record what changes.

## 9. Dart methods to practice

| Dart API | Purpose |
|---|---|
| `hasMatch()` | Checks whether at least one match exists |
| `firstMatch()` | Returns the first match, if any |
| `allMatches()` | Returns all matches |
| `matchAsPrefix()` | Checks for a match at the beginning of a string |
| `string.replaceAll()` | Replaces all matches |
| `string.replaceFirst()` | Replaces the first match |
| `string.split()` | Splits a string using a pattern |
| `Match.group(0)` | Returns the entire matched text |
| `Match.group(1)` | Returns the first captured group |
| `Match.namedGroup('name')` | Returns a named captured group |

---

# Part 2 — 100 problem-solving challenges

The exercises progress from isolated syntax features to combinations and practical scenarios. Unless a question says otherwise, write and test your solution in Dart.

## Section 1 — Character matching (1–10)

**Focus:** Literals, dots, character classes, ranges, negated classes.

### 1. Exact word finder
Given a sentence, find every occurrence of the word `dart`. Test whether your pattern also matches `Dart`, `darting`, and `mydart`.

### 2. Vowel finder
Extract every English vowel (`a`, `e`, `i`, `o`, `u`) from a paragraph. Make a second version that ignores letter case.

### 3. Consonant finder
Extract English letters that are not vowels. Do not include digits, punctuation, or spaces.

### 4. English-letter-only input
A username field accepts only English letters. Validate the entire input, not just a substring.

### 5. Digits-only input
A reference-code field accepts one or more digits and nothing else. Test empty input, spaces, signs, and decimal points.

### 6. Non-digit extraction
Given `Room 12, floor 3, building A`, extract the portions that are not digits. Decide whether spaces and punctuation should remain.

### 7. Hexadecimal characters
Extract sequences containing only hexadecimal characters (`0–9`, `a–f`, `A–F`) from a diagnostic string.

### 8. Restricted product code
A product code may contain uppercase letters and digits only. Validate the complete input.

### 9. Find punctuation
Extract punctuation characters from a sentence. Define clearly which punctuation marks your task should include.

### 10. Exclude a character set
Given a string, extract maximal sequences that contain no digits. Preserve spaces only if your chosen requirement calls for them.

## Section 2 — Special character classes and escaping (11–20)

**Focus:** `\d`, `\D`, `\w`, `\W`, `\s`, `\S`, escaped metacharacters.

### 11. Find all numbers
Extract every integer from `I bought 3 books, 2 pens and 15 pencils.`

### 12. Find words
Extract word-character sequences from a sentence containing words, underscores, and numbers. Explain what `\w` includes.

### 13. Find whitespace
Find every whitespace character in a multi-line string containing spaces, tabs, and line breaks.

### 14. Collapse whitespace
Replace every run of whitespace with one ordinary space. Then consider whether leading and trailing spaces should be trimmed separately.

### 15. Find literal dots
A log contains version strings such as `Dart 3.13.5`. Extract the dots themselves rather than treating `.` as a wildcard.

### 16. Find file names with a literal dot
Find filenames that contain a literal dot followed by an extension. Test names with multiple dots, such as `archive.backup.zip`.

### 17. Match parentheses
Extract text enclosed in one pair of parentheses, such as `(priority: high)`. Test what happens when the text contains nested parentheses.

### 18. Match plus signs
Find phone numbers that begin with a literal `+` country-code marker. Make sure the plus sign is not treated as a quantifier.

### 19. Backslash paths
Given Windows-style paths, identify the backslash separators. Be careful with escaping in both Dart strings and regex syntax.

### 20. Tabs in imported data
A text file uses tabs between columns. Detect lines containing at least one tab and split the fields using a regex separator.

## Section 3 — Quantifiers (21–30)

**Focus:** `*`, `+`, `?`, `{n}`, `{n,m}`, greedy and lazy matching.

### 21. Four-digit PIN
Validate a PIN containing exactly four digits. Reject shorter and longer values.

### 22. Optional country-code marker
Match a phone-like string with an optional leading plus sign. Define the accepted digit count separately.

### 23. Username length
Validate a username containing 5–12 English letters or digits.

### 24. Repeated separator
Find one or more consecutive hyphens in a product code. Then replace each run with a single hyphen.

### 25. Optional middle initial
Extract a person's first name, optional middle initial, and last name from a simple name format.

### 26. Bounded numeric field
Validate a field containing between 2 and 5 digits. Test whether leading zeros are allowed.

### 27. Empty or non-empty field
A comment may be empty or contain any number of non-newline characters. Compare `*` with `+`.

### 28. Greedy HTML-like extraction
Given `<b>one</b><b>two</b>`, use a greedy pattern to observe how much text it captures. Explain the result.

### 29. Lazy HTML-like extraction
Repeat question 28 with a lazy quantifier. Compare the matches and explain why the result differs.

### 30. Repeated character runs
Find runs of at least two identical letters, such as `aa`, `bbb`, or `cccc`. Return each run and its length.

## Section 4 — Anchors and boundaries (31–38)

**Focus:** `^`, `$`, `\b`, `\B`, full-input validation, multiline behavior.

### 31. Starts with a prefix
Validate product codes that must begin with `PRD-`. Test strings where the prefix appears only in the middle.

### 32. Ends with an extension
Find filenames that end in `.dart`. Reject names such as `file.dart.backup`.

### 33. Entire-string validation
Write a pattern that accepts exactly three digits. Demonstrate why checking for a match without anchoring can accept unwanted input.

### 34. Word boundary search
Find the standalone word `cat` in `cat catalog bobcat catapult`. Return only standalone occurrences.

### 35. Non-word boundary search
Find occurrences of `cat` that are not surrounded by word boundaries. Explain the difference from question 34.

### 36. Validate a line
A log line must begin with a timestamp marker and end with a status word. Validate the entire line.

### 37. Multiline anchors
Given several lines of text, use multiline mode to find lines that begin with `ERROR`. Compare the result with multiline mode disabled.

### 38. Final newline behavior
Test how your chosen end anchor behaves when a string ends with a newline. Document the behavior in Dart rather than assuming it is identical across regex engines.

## Section 5 — Groups, capturing, and alternation (39–50)

**Focus:** Capturing groups, non-capturing groups, named groups, alternation, precedence.

### 39. Extract a date
From `Meeting: 09/11/2026`, capture day, month, and year separately.

### 40. Extract a time
From `Meeting starts at 14:35`, capture hours and minutes separately.

### 41. Parse a product identifier
From `ART-2026-105`, capture the category, year, and item number.

### 42. Match several extensions
Find filenames ending in `.png`, `.jpg`, `.jpeg`, or `.pdf`. Use alternation and group the extension choices correctly.

### 43. Capturing versus non-capturing
Build two equivalent patterns for a product code: one using a capturing group and one using a non-capturing group. Compare the groups returned by Dart.

### 44. Named captures
Parse `username=laila` and capture the key and value using named groups.

### 45. Repeated structured fields
Extract all pairs of the form `key=value` from a configuration snippet. Return each key and value separately.

### 46. Name components
Parse a simple `First Last` format. Then extend it to support an optional middle name. State the limits of your simplified name format.

### 47. Phone number components
From `+962791234567`, capture the country code and subscriber number separately.

### 48. Price extraction
From `Pencil: $2.50, Notebook: $5.75`, extract the numeric price values. Then capture the associated product names.

### 49. Alternation precedence
Create a pattern that matches either `cat` or `dog` as a complete input. Add test cases that reveal what can go wrong when alternatives are not grouped.

### 50. Parse log prefixes
From `[ERROR] 2026-11-09 User login failed`, capture the log level, date, and message separately.

## Section 6 — Backreferences (51–58)

**Focus:** `\1`, `\2`, named backreferences, repeated text.

### 51. Repeated word
Detect consecutive repeated words, such as `is is` or `really really`, regardless of capitalization.

### 52. Matching quote pairs
Find a short quoted value where the opening and closing quote must be the same character. Test both single and double quotes.

### 53. Repeated separator
Find a sequence that starts and ends with the same separator character, using a backreference.

### 54. Duplicate tag name
Given a simple tag-like string such as `<title>Text</title>`, use a backreference to require the closing tag name to match the opening tag name.

### 55. Repeated identifier
Detect duplicated adjacent identifiers in a text stream, such as `AB12 AB12`.

### 56. Matching brackets
Match a simple pair of the same bracket type around text. Explain why this does not solve arbitrary nested-bracket parsing.

### 57. Repeated date component
Given a structured identifier with two date-like components, use a backreference to require the second component to equal the first.

### 58. Named backreference
Rewrite a repeated-word or matching-quote exercise using a named capture and named backreference. Verify Dart's supported syntax.

## Section 7 — Lookarounds (59–68)

**Focus:** Positive/negative lookahead and lookbehind.

### 59. Password contains a digit
Validate a password that must contain at least one digit, using a positive lookahead.

### 60. Password contains uppercase and lowercase
Require at least one uppercase and one lowercase English letter using lookaheads.

### 61. Password excludes whitespace
Use a negative lookahead or an appropriate character class to reject any whitespace. Compare the two approaches.

### 62. Number followed by a unit
Find numbers that are immediately followed by `MB` without including the unit in the returned match.

### 63. Number preceded by a currency symbol
Extract a price value only when it is preceded by `$`. Keep the currency symbol out of the match.

### 64. Exclude a reserved prefix
Find identifiers that do not begin with `SYS_`, using a negative lookahead anchored at the start.

### 65. Match a word before punctuation
Find words that are immediately followed by a comma or period, without including the punctuation in the match.

### 66. Find text after a marker
Extract a value that follows `token=` without including the marker itself.

### 67. Find a number not followed by a letter
Extract numeric values only when the next character is not an English letter.

### 68. Context-sensitive extraction
From a line containing `status=SUCCESS` or `status=FAILED`, extract the status value only when it follows the exact `status=` key.

## Section 8 — Flags, Unicode, and multiline text (69–76)

**Focus:** `caseSensitive`, `multiLine`, `dotAll`, `unicode`, line handling, international text.

### 69. Case-insensitive matching
Find every occurrence of `error` regardless of capitalization. Compare using a flag with manually listed alternatives.

### 70. Multiline log filtering
Given a multi-line log, extract every line beginning with `WARNING` using multiline mode.

### 71. Dot across lines
A message begins with `BEGIN` and ends with `END`, with multiple lines in between. Compare the result with `dotAll` disabled and enabled.

### 72. Case-insensitive extension check
Validate `.png`, `.jpg`, and `.pdf` filenames regardless of extension capitalization.

### 73. Unicode text
Find words in a paragraph containing English and non-English letters. Investigate Unicode property escapes supported by Dart and document the behavior of your chosen pattern.

### 74. Emoji and symbols
Explore how Dart regex treats emoji and supplementary Unicode characters. Compare matching a code unit, code point, and grapheme cluster; do not assume these are interchangeable.

### 75. Normalize whitespace
Find runs of spaces, tabs, and line breaks and replace them with one space. Test text from different operating systems.

### 76. Mixed-case identifiers
Extract identifiers while preserving their original spelling, but compare them case-insensitively when checking whether two identifiers are equal.

## Section 9 — Extraction, replacement, and splitting (77–86)

**Focus:** `allMatches`, capture groups, `replaceAll`, `replaceFirst`, `split`.

### 77. Extract email-like strings
Find email-shaped strings in a paragraph and capture their local part and domain. Treat this as text extraction, not proof that an address exists.

### 78. Extract URLs
Extract strings beginning with `http://` or `https://`. Test punctuation immediately after a URL and explain where a simple regex is insufficient.

### 79. Mask phone-like values
Replace phone-number-shaped values in a sample message with a masking string. Preserve surrounding text.

### 80. Remove duplicate spaces
Replace each run of ordinary spaces with one space, then compare with a solution that handles all whitespace.

### 81. Split CSV-like rows
Split a simple comma-separated row. Then test a field containing a quoted comma and explain why a basic regex split is not a complete CSV parser.

### 82. Extract hashtags
Find hashtags in a social-media post. Define which characters are allowed after `#`.

### 83. Extract mentions
Find user mentions such as `@laila` from a message. Avoid matching the `@` inside an email address if the requirement excludes emails.

### 84. Parse key-value lines
Extract keys and values from lines such as `port=8080`. Handle optional spaces around the equals sign.

### 85. Replace dates
Find dates in `DD/MM/YYYY` format and replace the separators with hyphens. Do not claim that this validates the calendar date.

### 86. Extract quoted values
Extract the contents of quoted strings from a configuration text. Test escaped quote characters and document the limitations of your pattern.

## Section 10 — Advanced combinations and practical scenarios (87–100)

**Focus:** Combining syntax, validating structured formats, security-aware detection, and recognizing regex limitations.

### 87. Username policy
Validate a username that:
- Contains 5–15 characters.
- Starts with an English letter.
- Contains only letters, digits, and underscores.
- Does not end with an underscore.

Test boundary lengths and invalid punctuation.

### 88. Strong password policy
Validate a password that:
- Has at least 8 characters.
- Contains an uppercase letter.
- Contains a lowercase letter.
- Contains a digit.
- Contains a special character from a specified set.
- Contains no whitespace.
- Has no three consecutive identical characters.

Use lookaheads where appropriate. Explain each condition.

### 89. Jordanian mobile number formats
Validate these requested formats:
- `0791234567`
- `+962791234567`
- `962791234567`

Use the same rule for the subscriber portion and make the optional country-code forms explicit. Treat this as format checking, not proof that a number is active or assigned.

### 90. IPv4 address validation
Validate IPv4 addresses with four decimal octets, each in the range 0–255. Test leading zeros and decide which policy your application should use.

### 91. Timestamped log parser
Parse lines such as:
```text
2026-11-09 10:30:20 INFO Login successful
2026-11-09 10:31:10 ERROR Invalid password
2026-11-09 10:32:15 WARNING Multiple login attempts
```
Capture date, time, log level, and message. Validate the date and time values separately if correctness matters.

### 92. Version number parser
Validate and extract the three numeric components from versions such as `1.0.0`, `2.15.3`, and `10.2.45`. Then decide how to handle leading zeros and optional prerelease labels.

### 93. File upload name checker
Accept `.png`, `.jpg`, `.jpeg`, and `.pdf` extensions case-insensitively. Test hidden files, multiple dots, trailing spaces, and filenames with no extension.

### 94. Date format and calendar validity
First match the `YYYY-MM-DD` shape. Then use Dart date logic to reject impossible dates, including invalid month lengths and leap-year mistakes. Explain why regex alone is not the best tool for full calendar validation.

### 95. HTML-like tag detection
Detect simple HTML-like opening, closing, and self-closing tags and capture tag names. Explain why regex is not a reliable general-purpose HTML parser.

### 96. Suspicious input indicators
Create separate detection patterns for:
- Script-like tags.
- HTML event-handler attribute names such as `onclick`.
- The `javascript:` URL scheme.

Test benign examples and explain why detection patterns alone do not prevent cross-site scripting. Use context-aware output encoding and appropriate HTML sanitization in real applications.

### 97. SQL-related log indicator search
Search sample logs for SQL error indicators and capture the surrounding log message. Distinguish log analysis from SQL injection prevention; do not treat a regex as a substitute for parameterized queries.

### 98. Configuration parser
Parse lines such as:
```text
username=laila
port=8080
environment=development
debug=true
```
Capture each key and value. Add support for blank lines and optional whitespace. Define how comments should be handled.

### 99. Failed-login event analyzer
Given application logs, extract events that indicate failed logins. Capture timestamps and relevant account identifiers where present. Test variations in capitalization and wording, and avoid treating a text match as proof of an attack.

### 100. Mini log-analysis project
Build a Dart program that processes a collection of sample logs and produces separate lists for:
- Valid IPv4 address candidates.
- Timestamp candidates.
- `ERROR` and `WARNING` events.
- Failed-login events.
- Email-shaped strings in messages.

For each extracted value, keep enough context to identify the original log line. Add tests for malformed data and explain which checks require logic beyond regex.

---

# Part 3 — Suggested Dart practice template

Use this small structure to test each exercise:

```dart
void main() {
  final pattern = RegExp(r'YOUR_PATTERN_HERE');

  final testCases = [
    'valid example',
    'invalid example',
    'edge case',
  ];

  for (final value in testCases) {
    print('$value => ${pattern.hasMatch(value)}');
  }
}
```

For extraction:

```dart
void main() {
  final pattern = RegExp(r'YOUR_PATTERN_HERE');
  const input = 'Put your test text here';

  for (final match in pattern.allMatches(input)) {
    print('Full match: ${match.group(0)}');
    print('First group: ${match.group(1)}');
  }
}
```

For replacement:

```dart
void main() {
  final pattern = RegExp(r'YOUR_PATTERN_HERE');
  const input = 'Put your test text here';

  print(input.replaceAll(pattern, 'REPLACEMENT'));
}
```

For splitting:

```dart
void main() {
  final separator = RegExp(r'YOUR_SEPARATOR_PATTERN');
  const input = 'one,two,three';

  print(input.split(separator));
}
```

---

# Part 4 — Completion checklist

Use this checklist to assess your understanding. Mark a topic complete only when you can explain it and solve an unfamiliar exercise with it.

- [ ] Literal characters and wildcards
- [ ] Character classes and negated classes
- [ ] Character ranges
- [ ] `\d`, `\D`, `\w`, `\W`, `\s`, `\S`
- [ ] Escaping special characters
- [ ] `*`, `+`, and `?`
- [ ] Exact and bounded quantifiers
- [ ] Greedy and lazy matching
- [ ] Start and end anchors
- [ ] Word boundaries
- [ ] Capturing groups
- [ ] Non-capturing groups
- [ ] Named capturing groups
- [ ] Alternation and grouping precedence
- [ ] Numbered backreferences
- [ ] Named backreferences
- [ ] Positive and negative lookahead
- [ ] Positive and negative lookbehind
- [ ] Case-sensitive and case-insensitive matching
- [ ] Multiline behavior
- [ ] Dot-all behavior
- [ ] Unicode considerations
- [ ] Extracting multiple matches
- [ ] Reading capture groups
- [ ] Replacing matches
- [ ] Splitting strings
- [ ] Debugging unexpected matches
- [ ] Recognizing when regex is not the right tool
- [ ] Avoiding overly complex or inefficient patterns
- [ ] Writing tests for valid, invalid, and edge-case inputs

---

## Important learning rules

1. Do not memorize a finished pattern without understanding each token.
2. Do not use a regex generator as a substitute for reasoning.
3. Always test both matching and non-matching examples.
4. Use anchors when validating an entire input.
5. Keep patterns readable; split complicated validation into smaller checks when that is clearer.
6. Be careful with untrusted input and performance. Some patterns can cause excessive backtracking.
7. Do not use regex alone to secure applications. Use established parsers, validation libraries, parameterized database queries, and context-aware output encoding where appropriate.
8. Remember that regex syntax and supported features vary between engines. Use Dart's documentation and tests as the source of truth for Dart behavior.

## Official Dart reference

- [Dart API — RegExp](https://api.dart.dev/dart-core/RegExp-class.html)
- [Dart API — Match](https://api.dart.dev/dart-core/Match-class.html)
