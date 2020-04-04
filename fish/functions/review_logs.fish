function review_logs --description 'Tail the logs from my review-app'
  stern review-darin-.\*-voltron-.\* #| sed -e 's/^\w*\ \w*\ *//' | kittie-print

	# GREP COMMAND
	# stern review-darin-.\*-voltron-.\* | egrep -v bots | grep -E 'cache:(\w+)|(?:Cache Hit Ratio: ([^"]+))'
end

