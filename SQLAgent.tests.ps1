Param(
    [object]$servers
)

$query = "select count(*) as Jobs from msdb.dbo.sysjobs as j join msdb.dbo.syscategories as c on c.category_id = j.category_id where j.owner_sid <> 0x01 and c.Name <> 'Report Server'"

foreach($server in $servers) {
    Describe "SQL Agent on $server" {
        It "has jobs only owned by sa" {
            (Invoke-Sqlcmd -ServerInstance $server -Query $query -ConnectionTimeout 1).Jobs | Should Be 0
        }
    }
}