<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>


<div id="infoMessage"><?php echo $message; ?></div>



<div class="card">
    <div class="card-header">
        Featured
    </div>
    <div class="card-body">


        <table id="data_table" class="table <?= setting('App.table_style'); ?>" cellspacing="0" style="width: 100%">
            <thead class="<?= setting('App.table_header_style'); ?>">
                <th><?php echo lang('Auth.index_fname_th'); ?></th>
                <th><?php echo lang('Auth.index_lname_th'); ?></th>
                <th><?php echo lang('Auth.index_email_th'); ?></th>
                <th><?php echo lang('Auth.index_groups_th'); ?></th>
                <th><?php echo lang('Auth.index_status_th'); ?></th>
                <th><?php echo lang('Auth.index_action_th'); ?></th>
            </thead>
            <?php foreach ($users as $user) : ?>
                <tr>
                    <td><?php echo htmlspecialchars($user->first_name, ENT_QUOTES, 'UTF-8'); ?></td>
                    <td><?php echo htmlspecialchars($user->last_name, ENT_QUOTES, 'UTF-8'); ?></td>
                    <td><?php echo htmlspecialchars($user->email, ENT_QUOTES, 'UTF-8'); ?></td>
                    <td>
                        <?php foreach ($user->groups as $group) : ?>
                            <?php echo anchor('auth/edit_group/' . $group->id, htmlspecialchars($group->name, ENT_QUOTES, 'UTF-8')); ?>
                            |
                        <?php endforeach ?>
                    </td>
                    <td><?php echo ($user->active) ? anchor('auth/deactivate/' . $user->id, lang('Auth.index_active_link')) : anchor("auth/activate/" . $user->id, lang('Auth.index_inactive_link')); ?>
                    </td>
                    <td><?php echo anchor('auth/edit_user/' . $user->id, lang('Auth.index_edit_link')); ?></td>
                </tr>
            <?php endforeach; ?>
        </table>

        <p><?php echo anchor('auth/create_user', lang('Auth.index_create_user_link')) ?> |
            <?php echo anchor('auth/create_group', lang('Auth.index_create_group_link')) ?></p>



    </div>
</div>


<?= $this->endSection() ?>
<!-- /.content -->


<!-- page script -->
<?= $this->section("pageScript") ?>

<script>
    // dataTables
    $(function() {
        var table = $('#data_table').removeAttr('width').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "scrollX": true,
            "scrollCollapse": false,
            "responsive": false,
        });
    });
</script>

<?= $this->endSection() ?>