<?php

use Discord\Webhook;

$wh = new Webhook( 'YOUR_WEBHOOK_URL' );
$embed = new \Discord\Embed();
$thumbnail = new \Discord\Embed\EmbedThumbnail();
$author = new \Discord\Embed\EmbedAuthor();
$field1 = new \Discord\Embed\EmbedField();
$field2 = new \Discord\Embed\EmbedField();
$field3 = new \Discord\Embed\EmbedField();
$footer = new \Discord\Embed\EmbedFooter();

$thumbnail->setUrl( 'https://pbs.twimg.com/media/C--1DR0UIAEr6Bw.png' );
$author
    ->setName( 'Discord' )
    ->setIconUrl( 'https://discordapp.com/assets/28174a34e77bb5e5310ced9f95cb480b.png' )
    ->setUrl( 'https://discordapp.com/' );
$field1
    ->setName( 'Field 1' )
    ->setValue( 'Some cool text' )
    ->setInline( true );
$field2
    ->setName( 'Field 2' )
    ->setValue( 'Another cool text' )
    ->setInline( true );
$field3
    ->setName( 'Field 3' )
    ->setValue( 'A full width field where I can write some more text' );
$footer->setText( 'Here goes the footer' );
$embed
    ->setTitle( 'This is my title' )
    ->setDescription( 'Another fancy description' )
    ->setColor( 15158332 )
    ->setThumbnail( $thumbnail )
    ->setAuthor( $author )
    ->setField( $field1 )
    ->setField( $field2 )
    ->setField( $field3 )
    ->setFooter( $footer );

$wh
    ->setUsername( 'Fancy Bot' )
    ->setAvatar( 'https://pbs.twimg.com/media/C51iiP9UYAIPpWP.png' )
    ->setEmbed( $embed )
    ->send();
