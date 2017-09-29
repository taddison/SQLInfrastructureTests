Param(
    [object]$servers
)

foreach($server in $servers) {
    Describe "SQL Instance $server" {
        It "has sp_whoisactive deployed" {
            (Invoke-Sqlcmd -ServerInstance $server -Query "select 1 as Deployed from master.INFORMATION_SCHEMA.ROUTINES as r where r.ROUTINE_NAME = 'sp_whoIsActive' and r.ROUTINE_SCHEMA = 'dbo'" -ConnectionTimeout 1).Deployed | Should Be 1
        }
    }
}