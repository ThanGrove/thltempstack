<?php include './templates/head.php'; ?>

        <?php

            $jsontxt = file_get_contents('https://randomuser.me/api/');
            $jobj = json_decode($jsontxt, TRUE);
            if (isset($jobj['results'][0]['name']['first'])) {
                $person = $jobj['results'][0];
                $data = array();
                $name = $person['name']['first'];
                $data['fullname'] = "{$person['name']['title']} {$person['name']['first']} {$person['name']['last']}";
                $loc = $person['location'];
                $data['address'] = "<blockquote style=\"max-width: 175px;\">
                                        {$loc['street']['number']} {$loc['street']['name']}<br/>
                                        {$loc['state']}, {$loc['country']}<br/>
                                        <span style=\"float:right;\">{$loc['postcode']}</span>
                                    </blockquote>";
                $data['email'] = $person['email'];
                $data['age'] = $person['dob']['age'];
                $bdtime = strtotime($person['dob']['date']);
                $data['birthday'] = date('l F j, Y \a\t g:i A', $bdtime);
            } else {
                $person = FALSE;
            }

        ?>
        <?php if ($person): ?>
            <h2 class="gradient">Hello <?php echo $name; ?>, It’s a New You!</h2>
            <ul>
                <?php foreach($data as $label => $val): ?>
                    <li class="<?php echo $label; ?>">
                        <label><?php echo $label; ?></label>
                        <span><?php echo $val; ?></span>
                    </li>
                <?php endforeach ?>
            </ul>
            <div class="desc">
                <p>Want to see the data? Then, click here: <input id="showbtn" type="button" value="Show Me" /></p>
            </div>
        <?php endif ?>
        <pre id="dataspace" class="hide"><?php
                $jout = json_encode($jobj, JSON_PRETTY_PRINT);
                echo "$jout";
            ?></pre>

<?php include './templates/foot.php'; ?>