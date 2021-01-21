module PhotosHelper
  def delete_photo?(event, photo)
    if current_user_can_edit?(event) || current_user == photo.user
      link_to fa_icon("fas fa-trash"), event_photo_path(@event, photo),
              method: :delete, data: { title: ' ',
                                       confirm: t('pages.photos.confirm.consent'),
                                       commit: t('global.confirm.ok'),
                                       cancel: t('global.confirm.cancel') }
    end
  end
end
