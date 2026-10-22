-module(ewe_test_ffi).

-export([date_age/1]).

date_age(Date) ->
  case httpd_util:convert_request_date(binary_to_list(Date)) of
    bad_date ->
      {error, nil};
    DateTime ->
      Seconds = calendar:datetime_to_gregorian_seconds(DateTime),
      Epoch = calendar:datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}}),
      {ok, erlang:system_time(second) - (Seconds - Epoch)}
  end.
