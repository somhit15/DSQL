select words, count(1) as hashtag_cnt from (
              select explode(split(tweet,' ')) as words from tweets2)w where w.words like '%#%' group by words order by count(1) desc, words desc limit 3