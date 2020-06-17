
$(document).on('turbolinks:load', function () {
    $(function () {
        // 画像をプレビュー表示させる.prev-contentを作成
        function buildHTML(image) {
            var html =
                `
                <div class="prev-content">
                    <img src="${image}", alt="preview" class="prev-image">
                </div>
                `
            return html;
        }

        // 画像が選択されたときに発火
        $(document).on('change', '.hidden_file', function () {
            // .file_filedからデータを取得して変数fileに代入
            var file = this.files[0];
            // FileReaderオブジェクトを作成
            var reader = new FileReader();
            // DataURIScheme文字列を取得
            reader.readAsDataURL(file);
            // 読み込みが完了したら処理が実行
            reader.onload = function () {
                // 読み込んだファイルの内容を取得して変数imageに代入
               var image = this.result;
                // プレビュー画像がなければ処理を実行
               if ($('.prev-content').length == 0) {
                   // 読み込んだ画像ファイルをbuildHTMLに代入
                    var html = buildHTML(image);
                    // 作成した.prev-contentをiconの代わりに表示
                    $('.prev-contents').prepend(html);
                    // 画像が表示されるのでiconを隠す
                    $('.photo-icon').hide(); 
               } else {
                   // もしすでに画像がプレビューされていれば画像データのみを入れ替える
                   $('.prev-content .prev-image').attr({ src: image });
               }
            }
        });
    });
});
