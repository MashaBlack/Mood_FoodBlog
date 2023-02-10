<div class="table" >
    <table class="table_sort" width="100%">
        <thead>
            <tr>
                <th>Рецепт</th>
                <th>Количество сохранений   </th>
            </tr>
        </thead>

        <tbody>
            <?php foreach ($arr as $key => $value) { ?>
            <tr>
                <td><?= $key ?></td>
                <td><?= $value ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>