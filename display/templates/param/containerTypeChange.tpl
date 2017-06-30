<h2>Modification d'un type de conteneur</h2>
<div class="row">
<div class="col-md-6">
<a href="index.php?module=containerTypeList">{$LANG.appli.1}</a>

<form class="form-horizontal protoform" id="containerTypeForm" method="post" action="index.php">
<input type="hidden" name="moduleBase" value="containerType">
<input type="hidden" name="action" value="Write">
<input type="hidden" name="container_type_id" value="{$data.container_type_id}">
<div class="form-group">
<label for="containerTypeName"  class="control-label col-md-4">Nom<span class="red">*</span> :</label>
<div class="col-md-8">
<input id="containerTypeName" type="text" class="form-control" name="container_type_name" value="{$data.container_type_name}" autofocus required></div>
</div>

<div class="form-group">
<label for="container_family_id" class="control-label col-md-4">Famille<span class="red">*</span> :</label>
<div class="col-md-8">
<select id="container_family_id" name="container_family_id" class="form-control">
{section name=lst loop=$containerFamily}
<option value="{$containerFamily[lst].container_family_id}" {if $containerFamily[lst].container_family_id == $data.container_family_id}selected{/if}>
{$containerFamily[lst].container_family_name}
</option>
{/section}
</select>
</div>
</div>

<div class="form-group">
<label for="containerTypeDescription"  class="control-label col-md-4">Description :</label>
<div class="col-md-8">
<textarea class="form-control" rows="3" name="container_type_description" id="containerTypeDescription">{$data.container_type_description}</textarea>
</div>
</div>

<div class="form-group">
<label for="storageConditionId" class="control-label col-md-4">Condition de stockage :</label>
<div class="col-md-8">
<select id="storageConditionId" name="storage_condition_id" class="form-control">
<option value="" {if $data.storage_condition_id == ""}selected{/if}>
{$LANG.appli.2}
</option>
{section name=lst loop=$storageCondition}
<option value="{$storageCondition[lst].storage_condition_id}" {if $storageCondition[lst].storage_condition_id == $data.storage_condition_id}selected{/if}>
{$storageCondition[lst].storage_condition_name}
</option>
{/section}
</select>
</div>
</div>

<div class="form-group">
<label for="storageProduct"  class="control-label col-md-4">Produit utilisé :</label>
<div class="col-md-8">
<input id="storageProduct" type="text" class="form-control" name="storage_product" value="{$data.storage_product}" >
</div>
</div>

<div class="form-group">
<label for="clpClassification"  class="control-label col-md-4">Code de risque CLP :</label>
<div class="col-md-8">
<input id="clpClassification" type="text" class="form-control" name="clp_classification" value="{$data.clp_classification}" >
</div>
</div>

<div class="form-group">
<label for="nbRaw" class="control-label col-md-4">Nombre de lignes :</label>
<div class="col-md-8">
<input id="nbRaw" name="container_type_nb_raw" value="{$data.container_type_nb_raw}" type="number" class="form-control">
</div>
</div>

<div class="form-group">
<label for="nbColumn" class="control-label col-md-4">Nombre de colonnes :</label>
<div class="col-md-8">
<input id="nbColumn" name="container_type_nb_column" value="{$data.container_type_nb_column}" type="number" class="form-control">
</div>
</div>

<div class="form-group">
<label for="labelId" class="control-label col-md-4">Modèle d'étiquette :</label>
<div class="col-md-8">
<select id="labelId" name="label_id" class="form-control">
<option value="" {if $data.label_id == ""}selected{/if}>
{$LANG.appli.2}
</option>
{section name=lst loop=$labels}
<option value="{$labels[lst].label_id}" {if $labels[lst].label_id == $data.label_id}selected{/if}>
{$labels[lst].label_name}
</option>
{/section}
</select>
</div>
</div>



<div class="form-group center">
      <button type="submit" class="btn btn-primary button-valid">{$LANG["message"].19}</button>
      {if $data.container_type_id > 0 }
      <button class="btn btn-danger button-delete">{$LANG["message"].20}</button>
      {/if}
 </div>
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">{$LANG["message"].36}</span>