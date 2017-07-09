Param(
    [object]$servers
)

$query = "dbcc tracestatus(3226)"

foreach($server in $servers) {
    Describe "SQL Instance $server" {
        It "has backup messages suppressed from logs (TF3226)" {
            (Invoke-Sqlcmd -ServerInstance $server -Query $query -ConnectionTimeout 1).Status | Should Be 1
        }
    }
}