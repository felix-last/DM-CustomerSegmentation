if NAME="CustomerAge" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_CustomerAge" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="FirstPolicyYear" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_FirstPolicyYear" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
