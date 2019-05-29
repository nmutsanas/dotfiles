def walk(f):
  . as $in
  | if type == "object" then
      reduce keys[] as $key
        ( {}; . + { ($key):  ($in[$key] | walk(f)) } ) | f
  elif type == "array" then map( walk(f) ) | f
  else f
  end;

def schema:
  path(..)
  | map(tostring)
  | join("/");def mapper(f):
  if type == "array" then map(f)
  elif type == "object" then
  . as $in
  | reduce keys[] as $key
      ({};
       [$in[$key] | f ] as $value
       | if $value | length == 0 then .
         else . + {($key): $value[0]} end)
  else .
  end;

def mapper(f):
  if type == "array" then map(f)
  elif type == "object" then
  . as $in
  | reduce keys[] as $key
      ({};
       [$in[$key] | f ] as $value
       | if $value | length == 0 then .
         else . + {($key): $value[0]} end)
  else .
  end;