<div id="wall">
    {if $wallmessage}
        <p>{$wallmessage}</p>
    {/if}
    {if $wallposts}
        {foreach from=$wallposts item=wallpost}
            <div class="wallpost{if $wallpost->private} private{/if}">
                <div class="userinfo"><img src="{$WWWROOT}thumb.php?type=profileicon&amp;maxwidth=25&amp;maxheight=25&amp;id={$wallpost->from}" alt="Profile Icon">
                <div><a href="{$WWWROOT}user/view.php?id={$wallpost->userid|escape}">{$wallpost->displayname|escape}</a>
                <span class="postedon"> - {$wallpost->postdate|format_date}</span>
                </div></div>
                <div class="text">{$wallpost->text|parse_bbcode}</div>
                {*<div class="controls">
        {if $ownwall}
                    [ <a href="{$WWWROOT}blocktype/wall/wall.php?instance={$instanceid}&amp;replyto={$wallpost->id}">{str tag='reply' section='blocktype.wall'}</a> ]
        {/if}
        {if $ownwall || $wallpost->from == $userid}
                    [ <a href="{$WWWROOT}blocktype/wall/deletepost.php?instance={$instanceid}&amp;return={if $wholewall}wall{else}profile{/if}">
                        {str tag='delete' section='blocktype.wall'}
                    </a> ]
        {/if}
                </div>*}
            </div>
        {/foreach}
        {if !$wholewall}
            <a href="{$WWWROOT}blocktype/wall/wall.php?id={$instanceid}">{str tag='wholewall' section='blocktype.wall'}</a>
        {/if}
    {/if}
</div>