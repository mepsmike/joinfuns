CKEDITOR.editorConfig = (config) ->
  config.language = 'zh'
  config.toolbar_Pure = [
    { name: 'styles',      items: [ 'Format' ]},
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline'] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList', '-','JustifyLeft','JustifyCenter','JustifyRight'] },
    { name: 'links',       items: [ 'Link','Unlink'] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'Image','HorizontalRule'] },
  ]
  config.toolbar = 'Pure'
  true
