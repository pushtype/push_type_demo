module ApplicationHelper

  def title(str)
    content_for :title, str
  end

  def meta(name, content)
    content_for(:meta) { tag :meta, name: name.to_s, content: content }
  end

  def body_class(node)
    classes = case node
      when ArticleList  then %w( home blog hfeed has-sidebar )
      when Article      then %w( post-template-default single single-post single-format-standard has-sidebar )
      when Category     then %w( archive category hfeed has-header-image has-sidebar page-two-column colors-light )
      when Page         then %w( page-template-default page page-two-column )
    end
    classes.push *%w( has-header-image colors-light )
    classes.join(' ')
  end

  def node_class(node)
    classes = case node
      when Article  then %w( post type-post format-standard )
      when Page     then %w( page type-page )
    end
    classes.push 'hentry'
    classes.join(' ')
  end

  def embedded_svg(file_name)
    file = Rails.root.join('vendor/assets/images', file_name)
    File.read(file).html_safe
  end

  def svg_icon(icon, text = nil, html_opts = {})
    html_opts.merge! 'aria-hidden' => true, 'role' => 'img'
    html_opts[:class] = ["icon icon-#{ icon }", html_opts[:class]].compact.join(' ')
    html = content_tag :svg, html_opts do
      content_tag :use, nil, :'xlink:href' => "#icon-#{ icon }"
    end
    [html, text].compact.join(' ').html_safe
  end

end
