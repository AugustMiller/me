<?php if(!defined('KIRBY')) exit ?>

title: Site
pages: default
fields:
  title:
    label: Title
    type:  text
  author:
    label: Author
    type:  text
  description:
    label: Description
    type:  textarea
  keywords:
    label: Keywords
    type:  tags
  footer:
    label: Footer
    type:  textarea
  colophon:
    label: Colophon
    type: textarea

  utility:
    label: Utility
    type: headline

  ga_key:
    label: Google Analytics Tracking Key
    type: text