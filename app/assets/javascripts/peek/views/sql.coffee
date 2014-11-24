$(document).on 'peek:render', (event, id, results) ->
  el = $('#peek-sql-queries').empty()
  for [type, time, calls] in results.data.sql.queries
    count = calls.length
    count = if count == 1 then '1 call' else "#{count} calls"

    el.append("<li>#{type} (#{time}) - #{count}</li>")
