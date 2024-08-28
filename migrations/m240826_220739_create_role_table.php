<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%role}}`.
 */
class m240826_220739_create_role_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    
    /*for generating of roles*/
    public function up()
    {
        $this->createTable('{{%role}}', [
            'id' => $this->primaryKey(),
            'name' => $this->string()->notNull()->unique(),
        ]);
    }

    public function down()
    {
        $this->dropTable('{{%role}}');
    }
}
