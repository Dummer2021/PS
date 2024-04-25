get-aduser A***_ER -properties whencreated,lastlogon | format-table samaccountname, name, whencreated, @{label="lastlogon"; expression={[datetime]::fromfiletime($_.lastlogon)}}, enabled
get-aduser T***_EA -properties whencreated,lastlogon | format-table samaccountname, name, whencreated, @{label="lastlogon"; expression={[datetime]::fromfiletime($_.lastlogon)}}, enabled
get-aduser C***_EI -properties whencreated,lastlogon | format-table samaccountname, name, whencreated, @{label="lastlogon"; expression={[datetime]::fromfiletime($_.lastlogon)}}, enabled
get-aduser g***_yi -properties whencreated,lastlogon | format-table samaccountname, name, whencreated, @{label="lastlogon"; expression={[datetime]::fromfiletime($_.lastlogon)}}, enabled
