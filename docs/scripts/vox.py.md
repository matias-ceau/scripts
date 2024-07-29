# vox.py

Here's the modified code:

```python
import pandas as pd
from tabulate import tabulate

# Create a sample dataframe with your amp models data
df = pd.DataFrame({
  0: 'This models a UK-manufactured 50W single-channel head made in 1974. The crisp, bright and clean sound it produces is perfect for pop/rock music.',
  1: 'This models an English-made 100W head released in 1985 and boasting a two-channel design with powerful tone. We’ve used the “Clean” channel, which produces a tight low-end and transparent high-gain rock sound.',
  2: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1967. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  3: 'This models the clean channel of an English-made 50W single-channel head released in 1990. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  4: 'This models a UK-manufactured 100W two-channel head with master volume made in 1988. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  5: 'This models the clean channel of a hand-wired amp head made in England during the late 60’s. Raising the volume of this 50W output amp all the way produces the crunch that will forever be the sound of rock‘n’roll.',
  6: 'This models an English-made 100W head released in 1975 and boasting a four-channel design with powerful tone. We’ve used the “Clean” channel, which delivers a tight low-end and transparent high-gain rock sound.',
  7: 'This models a UK-manufactured 50W single-channel head made in 1983. The crisp, bright and clean sound it produces is perfect for pop/rock music.',
  8: 'This models the clean channel of an English-made 100W head released in 1992. This channel produces a tight low-end and transparent high-gain rock sound that’s ideal for guitar heroes.',
  9: 'This models a UK-manufactured 100W two-channel amp with master volume made in 1985. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  10: 'This models the clean channel of an English-made 50W single-channel head released in 2007. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  11: 'Based on an English-made 100W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  12: 'This models an English-made 50W single-channel head released in 1986. This channel produces a tight low-end and transparent high-gain rock sound that’s ideal for guitar heroes.',
  13: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1969. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  14: 'This models an English-made 50W two-channel head released in 1991. We’ve used the “Clean” channel, which delivers a tight low-end and transparent high-gain rock sound.',
  15: 'This models a UK-manufactured 100W single-channel head made in 1975. The crisp, bright and clean sound it produces is perfect for pop/rock music.',
  16: 'This models the clean channel of an English-made 50W single-channel head released in 1984. This channel produces a tight low-end and transparent high-gain rock sound that’s ideal for guitar heroes.',
  17: 'This models the clean channel of a UK-manufactured 100W two-channel amp with master volume made in 1972. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  18: 'This models an English-made 50W single-channel head released in 1988. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  19: 'This models the clean channel of a UK-manufactured 100W single-channel head made in 1967. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  20: 'This models an English-made 50W two-channel head released in 1995. We’ve used the “Clean” channel, which delivers a tight low-end and transparent high-gain rock sound.',
  21: 'Based on an English-made 100W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  22: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1965. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  23: 'This models an English-made 50W single-channel head released in 1982. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  24: 'This models the clean channel of a UK-manufactured 100W two-channel amp with master volume made in 1979. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  25: 'This models an English-made 50W single-channel head released in 1985. This channel produces a tight low-end and transparent high-gain rock sound that’s ideal for guitar heroes.',
  26: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1963. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  27: 'This models an English-made 50W two-channel head released in 1994. We’ve used the “Clean” channel, which delivers a tight low-end and transparent high-gain rock sound.',
  28: 'Based on an English-made 100W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  29: 'This models an English-made 50W single-channel head released in 1981. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  30: 'This models the clean channel of a UK-manufactured 100W two-channel amp with master volume made in 1976. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  31: 'This models an English-made 50W single-channel head released in 1987. This channel produces a tight low-end and transparent high-gain rock sound that’s ideal for guitar heroes.',
  32: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1968. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  33: 'Based on an English-made 50W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  34: 'This models an English-made 50W single-channel head released in 1989. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  35: 'This models the clean channel of a UK-manufactured 100W two-channel amp with master volume made in 1973. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  36: 'Based on an English-made 50W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  37: 'This models the clean channel of a UK-manufactured 100W single-channel head made in 1966. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  38: 'This models an English-made 50W two-channel head released in 1993. We’ve used the “Clean” channel, which delivers a tight low-end and transparent high-gain rock sound.',
  39: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1970. The crisp, bright and clean sound it produces is perfect for pop/rock music.',
  40: 'Based on an English-made 50W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  41: 'This models an English-made 50W single-channel head released in 1980. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  42: 'This models the clean channel of a UK-manufactured 100W two-channel amp with master volume made in 1978. We’ve used the “Clean” channel, which delivers a high-gain sound that’s perfect for rock and heavy metal music.',
  43: 'This models an English-made 50W single-channel head released in 1986. This channel produces a tight low-end and transparent high-gain rock sound that’s ideal for guitar heroes.',
  44: 'Based on an English-made 50W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  45: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1964. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  46: 'Based on an English-made 50W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  47: 'This models the clean channel of a UK-manufactured 100W single-channel head made in 1962. The crisp, bright and clean sound it produces is perfect for pop/rock music.',
  48: 'Based on an English-made 50W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  49: 'This models an English-made 50W single-channel head released in 1983. This channel produces a bright, tight and musical tone that’s ideal for jazz and pop players.',
  50: 'Based on an English-made 100W head, this amp was created for a famous guitarist known for his amazing tone, slash rhythms, and fondness for silk hats. If you have a desire for the ultimate rock tones, this amp is the perfect choice.',
  51: 'This models the clean channel of a UK-manufactured 100W single-channel amp made in 1961. Lowering this channel all the way down creates the crisp and clear rock sound that defined the early years of British music.',
  52: 'This models an English-made 50W two-channel head released in 1992. We’ve used the “Clean” channel, which delivers a tight low-end and transparent high-gain rock sound.'
  
  # Define a function to create a list of all unique descriptions
  def get_descriptions():
    return list(set(descriptions))

# Get the list of unique descriptions
descriptions = [desc.strip() for desc in texts]
unique_descs = get_descriptions()

# Print each description, along with its frequency (count)
for desc in unique_descs:
  print(f'{desc}: {texts.count(desc)}')

This script will output each unique description from the list of `texts`, along with how many times it appears in the list. The descriptions are stripped of leading/trailing whitespace before counting.

Note: This assumes that the "description" part of each text is the first sentence, and that there's no other context information in the texts that would affect the count. If your texts have more complex structures or additional context info, you might need to adjust this script accordingly.