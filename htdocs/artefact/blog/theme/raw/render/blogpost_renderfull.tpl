{**
 * This template displays a blog post.
 *}
{if $published}
<div id="blogpost">
  {if $artefacttitle}<h3 class="title">{$artefacttitle|safe}</h3>{/if}
  {$artefactdescription|clean_html|safe}
  {if isset($attachments)}
  <table class="cb attachments fullwidth">
    <tbody>
      <tr><th colspan="2">{str tag=attachedfiles section=artefact.blog}:</th></tr>
  {if $artefacttags}<div class="tags">{str tag=tags}: {list_tags owner=$artefactowner tags=$artefacttags}</div>{/if}
  {foreach from=$attachments item=item}
      <tr class="{cycle values='r0,r1'}">
        {if $icons}<td class="icon-container"><img src="{$item->iconpath}" alt=""></td>{/if}
        <td><a href="{$item->viewpath}">{$item->title}</a> ({$item->size}) - <strong><a href="{$item->downloadpath}">{str tag=Download section=artefact.file}</a></strong>
        <br>{$item->description}</td>
      </tr>
  {/foreach}
    </tbody>
  </table>
  {/if}
  <div class="postdetails">{$postedbyon}
    {if isset($commentcount) && $artefact->get('allowcomments')} | <a href="{$artefacturl}">{str tag=Comments section=artefact.comment} ({$commentcount})</a>{/if}

  </div>
  {if $license}
    <div class="postlicense">
      {$license|safe}
    </div>
  {/if}
</div>
{else}
<div>
{$notpublishedblogpost|safe}
</div>
{/if}