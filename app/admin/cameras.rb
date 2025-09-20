ActiveAdmin.register Camera do
  menu priority: 6
  permit_params :bus_id, :name, :location, :stream_url

  index do
    selectable_column
    id_column
    column :bus
    column :name
    column :location
    column :stream_url
    actions
  end

  form do |f|
    f.inputs "Camera Details" do
      f.input :bus
      f.input :name
      f.input :location
      f.input :stream_url
    end
    f.actions
  end

  show do |camera|
    attributes_table do
      row :bus
      row :name
      row :location
      row :stream_url
    end

    panel "Live Stream" do
      div do
        raw %(
          <video id="video_#{camera.id}" width="720" height="420" controls autoplay></video>
          <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
          <script>
            document.addEventListener("DOMContentLoaded", function() {
              var video = document.getElementById("video_#{camera.id}");
              var url = "#{camera.stream_url}";
              if (Hls.isSupported()) {
                var hls = new Hls();
                hls.loadSource(url);
                hls.attachMedia(video);
                hls.on(Hls.Events.MANIFEST_PARSED, function() {
                  video.play();
                });
              } else if (video.canPlayType("application/vnd.apple.mpegurl")) {
                video.src = url;
                video.addEventListener("loadedmetadata", function() {
                  video.play();
                });
              }
            });
          </script>
        )
      end
    end
  end
end
