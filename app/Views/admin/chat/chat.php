<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>


<div class="card direct-chat direct-chat-primary">
    <div class="card-header">
        <h3 class="card-title">Direct Chat</h3>

        <div class="card-tools">
            <span title="3 New Messages" class="badge badge-primary">3</span>
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <!-- Conversations are loaded here -->
        <div class="direct-chat-messages">


            <div id="getmsg">


            </div>

        </div>
        <!-- /.card-body -->
        <div class="card-footer">
            <form action="#" method="post">
                <div class="input-group">
                    <textarea name="message" id="msg" class="form-control"></textarea>
                    <span id="msg_err"></span>
                    <span class="input-group-append">
                        <button type="submit" id="send" class="btn btn-success">Send</button>
                    </span>
                </div>
            </form>
        </div>
        <!-- /.card-footer-->
    </div>
</div>




<?= $this->endSection() ?>
<!-- /.content -->


<!-- page script -->
<?= $this->section("pageScript") ?>
<script>
$(document).ready(function() {

    setInterval(function() {
        showmsg();
    }, 5000);

    showmsg();

    function showmsg() {
        $.ajax({
            type: "GET",
            url: '<?= base_url('admin/chat/msg') ?>',
            async: true,
            dataType: 'JSON',
            success: function(data) {
                var html = "";
                for (i = 0; i < data.length; i++) {
                    html += "<div class='card'><div class='card-body'><p class='card-text'>" + data[
                            i]
                        .created_at + "-" + data[i].username +
                        "</p></div><div class='card-footer text-muted'>" + data[
                            i].message + "</div></div>";
                }
                $("#getmsg").html(html);
            },
            error: function(err) {
                console.log(err);
            }
        });
    }

    $("#send").on('click', function(e) {
        e.preventDefault();
        var msg = $("#msg").val();
        $.ajax({
            type: "POST",
            url: '<?= base_url('admin/chat/chat') ?>',
            dataType: 'JSON',
            data: {
                message: msg
            },
            success: function(data) {
                console.log('sent');
                showmsg();
                $("#msg").val("");
            },
            error: function(err) {
                $("#msg_err").text(err.responseJSON.messages.message);
                $("#msg_err").addClass('text-danger');
            }
        });
    });
});
</script>
<?= $this->endSection() ?>