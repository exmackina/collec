<h2>{$LANG["appli"]["Familles_de_conteneurs"]}</h2>
	<div class="row">
	<div class="col-md-6">
{if $droits.param == 1}
<a href="index.php?module=containerFamilyChange&container_family_id=0">
{$LANG["appli"]["Nouveau..."]}
</a>
{/if}
<table id="containerFamilyList" class="table table-bordered table-hover datatable " >
<thead>
<tr>
<th>{$LANG["appli"]["Nom"]}</th>
<th>{$LANG["appli"]["Types de containers facilement déplaçables ?"]}</th>
</tr>
</thead>
<tbody>
{section name=lst loop=$data}
<tr>
<td>
{if $droits.param == 1}
<a href="index.php?module=containerFamilyChange&container_family_id={$data[lst].container_family_id}">
{$data[lst].container_family_name}
{else}
{$data[lst].container_family_name}
{/if}
</td>
<td class="center">
{if $data[lst].is_movable == 1}oui{else}non{/if}
</td>
</tr>
{/section}
</tbody>
</table>
</div>
</div>