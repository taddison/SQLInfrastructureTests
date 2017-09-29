Param(
    [object]$servers
)

foreach($server in $servers) {
    Describe "SQL Instance $server" {
        It "has backup messages suppressed from logs (TF3226)" {
            (Invoke-Sqlcmd -ServerInstance $server -Query "dbcc tracestatus(3226)" -ConnectionTimeout 1).Status | Should Be 1
        }
        It "has single threaded redo (TF3459)" {
            (Invoke-Sqlcmd -ServerInstance $server -Query "dbcc tracestatus(3459)" -ConnectionTimeout 1).Status | Should Be 1
        }
        It "has lightweight query statistics profiling enabled (TF7412)" {
            (Invoke-Sqlcmd -ServerInstance $server -Query "dbcc tracestatus(7412)" -ConnectionTimeout 1).Status | Should Be 1
        }
    }
}