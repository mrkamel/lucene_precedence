
# LucenePrecedence

Fixing precendence for the OR operator of Lucene's default query parser by using groups

## Example

<pre>
irb> LucenePrecedence.fix "a OR b c"
=> "( a OR b ) c"
irb> LucenePrecedence.fix "a (b c) OR d"
=> "a ( ( b c ) OR d )"
</pre>

